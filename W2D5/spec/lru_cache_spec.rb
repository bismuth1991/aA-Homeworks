require 'lru_cache'

RSpec.describe LRUCache do
  subject(:my_cache) { LRUCache.new(4) }

  describe "#initialize" do
    it "initializes with an empty array" do
      expect(my_cache.store).to eq([])
    end

    it "has a maximum size" do
      expect(my_cache.max_size).to eq(4)
    end
  end

  describe "#add" do
    before(:each) do
      my_cache.add("I walk the line")
      my_cache.add(5)
      my_cache.add([1, 2, 3])
    end

    context "when element does not exist yet" do
      it "adds element to the end" do
        expect(my_cache.store).to eq(["I walk the line", 5, [1, 2, 3]])
      end

      it "deletes the oldest element when exceeding maximum size" do
        my_cache.add(-5)
        my_cache.add("hello")
        expect(my_cache.store).to eq([5, [1, 2, 3], -5, "hello"])
      end
    end

    context "when element has already exists" do
      it "deletes the current element, then add to the end" do
        my_cache.add(5)
        expect(my_cache.store).to eq(["I walk the line", [1, 2, 3], 5])
      end
    end
  end

  describe "#count" do
    it "returns the correct length" do
      my_cache.add("I walk the line")
      my_cache.add(5)

      expect(my_cache.count).to eq(2)
    end
  end

  describe "#show" do
    let(:sample_result) { [[1, 2, 3, 4], :ring_of_fire, 'I walk the line', { :a=>1, :b=>2, :c=>3 }] }
    it "displays an array containing all current elements" do
      my_cache.add("I walk the line")
      my_cache.add(5)
      my_cache.add([1, 2, 3])
      my_cache.add(5)
      my_cache.add(-5)
      my_cache.add({ a: 1, b: 2, c: 3 })
      my_cache.add([1, 2, 3, 4])
      my_cache.add("I walk the line")
      my_cache.add(:ring_of_fire)
      my_cache.add("I walk the line")
      my_cache.add({ a: 1, b: 2, c: 3 })

      expect(my_cache.show).to include("#{sample_result}")
    end
  end
end
