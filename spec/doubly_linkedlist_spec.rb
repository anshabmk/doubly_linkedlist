RSpec.describe DoublyLinkedlist do
  it "has a version number" do
    expect(DoublyLinkedlist::VERSION).not_to be nil
  end

  it "requires doubly_linkedlist/list" do
    expect(DoublyLinkedlist::List).not_to be nil
  end

  context "Conversion from Array" do
    it "should monkey patch to_list method into Array class" do
      expect(Array.new.methods.include?(:to_list)).to be true
    end

    it "should convert an array into a doubly linkedlist" do
      random_arr = Array.new(Random.rand(10), Random.rand(100))
      list = random_arr.to_list

      expect(list.class).to eql(DoublyLinkedlist::List)
    end
  end
end
