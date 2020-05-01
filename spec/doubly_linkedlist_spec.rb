RSpec.describe DoublyLinkedlist do
  it "has a version number" do
    expect(DoublyLinkedlist::VERSION).not_to be nil
  end

  it "requires doubly_linkedlist/list" do
    expect(DoublyLinkedlist::List).not_to be nil
  end
end
