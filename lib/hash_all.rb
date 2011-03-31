module HashAll

  class ActiveRecord::Base
    
    # Wrapper/helper for ActiveRecord <tt>find(:all, *args)</tt>. Returns a collection of 
    # objects injected into a Hash. The attribute used as a key for the Hash should be 
    # specified as first argument. if :fetch is not specified in the arguments the whole 
    # object will be assigned as value, otherwise only the attribute spefified.
    # You can pass in all the same arguments to this method as you can to <tt>find(:all)</tt>.
    #
    # ==== Example
    #
    # Given the models:
    #
    # Feed(id: integer, state: string, name: string)
    # Post(id: integer, feed_name: string, title: string, url: string)
    #
    # count the number of posts of every state. Row count is too high to use SQL JOIN.
    #
    # @post_per_state = {}
    # feeds  = Feed.hash_all('feed_name', :fetch => 'state')
    # posts  = Post.all(:select      => 'COUNT(id), feed_name',
    #                   :group       => 'feed_name')
    # posts.each do |p|
    #   @post_per_state[feeds[p.feed_name]] ||= 0 
    #   @post_per_state[feeds[p.feed_name]] += p.attributes['COUNT(id)'].to_i
    # end
    #
    # => {"new york"=>6, "georgia"=>11, "new mexico"=>2, ... }
    
    def self.hash_all(hash_key='id', args={})
      fetch = args.delete(:fetch)
      collection = find(:all, args)
      return {} if collection.empty?
      collection.each.inject({}) { |hash,obj| hash[obj.send(hash_key)] = (fetch.nil? ? obj : obj.send(fetch)); hash} 
    end
  
  end

end