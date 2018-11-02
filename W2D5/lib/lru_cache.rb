class LRUCache
    attr_reader :store, :max_size

    def initialize(max_size)
      @store = []
      @max_size = max_size
    end

    def count
      store.count
    end

    def add(el)
      if store.include?(el)
        idx = store.find_index(el)
        store.insert(-1, store.delete_at(idx))
      else
        if store.count == 4
          store.shift
          store.push(el)
        else
          store.push(el)
        end
      end
    end

    def show
      "#{store}"
    end

    private
    # helper methods go here!

  end
