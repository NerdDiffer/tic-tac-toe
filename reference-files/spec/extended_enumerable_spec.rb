require_relative '../extended_enumerable'

describe "my_each" do
  it "should take an enum, populate a new enum using each item" do
    arr = [4, 3, 78, 2, 0, 2]
    answer = ["4!", "3!", "78!", "2!", "0!", "2!"]
    my_result = []
    arr.my_each { |n| my_result << "#{n}!"  }
    expect(my_result).to eq answer
  end
end

describe "my_each_with_index" do
  it "should take an enum, populate a new enum using each item & its index" do
    arr = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf']
    answer = [
      '1. Alpha', '2. Bravo', '3. Charlie', '4. Delta', 
      '5. Echo', '6. Foxtrot', '7. Golf'
    ]
    my_result = []
    arr.my_each_with_index { |v, i| my_result << "#{i+1}. #{v.capitalize}" }
    expect(my_result).to eq answer
  end
end

describe "my_select" do
  it "should return a new enum that has the items from the original block which returned true according to the passed-in block" do
    arr = [1,2,3,4,5,6,7,8,100]    
    answer = [2,4,6,8,100]
    expect(arr.my_select { |v| v % 2 == 0 }).to eq answer
  end
end

describe "my_all?" do
  it "returns true if the passed-in block returns a value other than false or nil on every single element in enum, otherwise false" do
    arr = [1,2,3,4,5,6,7,8,100]    
    expect(arr.my_all? { |v| v > 1 }).to eq false
  end

  it "if a block is not given, then it will add an implicit block which returns true if NONE OF the enum elements returns false or nil" do
    arr = [0, '', nil]
    expect(arr.my_all?).to eq false
  end
end

describe "my_any?" do
  it "returns true if the passed-in block returns a value other than nil or false on at least one element in enum, otherwise false" do
   arr = [1,2,3,4,5,6,7,8,100]     
   expect(arr.my_any? {|v| v > 100}).to eq false
  end
  
  it "if a block is not given, then it will add an implicit block which returns true if at least of the enum elements is NOT false or nil" do
    arr = [0, '']
    expect(arr.my_any?).to eq true
  end
end

describe "my_none?" do
  it "if a block is not given, then returns true if the passed-in block returns true on absolutely NONE of the elements in the enum, otherwise false" do
    arr = [true, 'this is true', 1]
    expect(arr.my_none?).to eq true
  end

  it "if a block is given, then returns true if the block does NOT return true on all the elements" do
    arr_odds = [1,3,5,7,9]
    arr_evens = [2,4,6,8,10]
    expect(arr_odds.my_none? { |i| i % 2 == 0} ).to eq true
    expect(arr_evens.my_none? { |i| i % 2 != 0} ).to eq true
  end
end

describe "my_count" do
  it "returns the number of items in enum" do
    arr = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf']
    expect(arr.my_count).to equal 7
  end
  
  it "if an argument is given, returns number of enum elements whose value is equal to the passed-in argument" do
    arr = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf']
    expect(arr.my_count('bravo')).to eq 1
  end

  it "if a block is given, returns the number of items in enum which return true on the condition tested by the given block" do
    arr = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf']
    expect(arr.my_count {|v| v.length == 5}).to equal 3
  end
end

describe "my_map" do
  it "returns a new enum with results of running the passed-in block once on each element of enum" do
    arr = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf']
    answer = ['Ahpla', 'Ovarb', 'Eilrahc', 'Atled', 'Ohce', 'Tortxof', 'Flog']
    my_result = arr.my_map {|v| v.reverse.capitalize}
    expect(my_result).to eq answer
  end
end

describe "my_inject" do
  it "combines all elements of enum into a single value" do
    arr = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf']
    expect(arr.my_inject(0) { |sum, n| sum + n.length } ).to eq 37
  end
end
