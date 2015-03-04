require_relative '../bubble_sort'

describe "bubble_sort" do

  it "should take an array, sort & return it, using bubble sort" do
    arr = [4, 3, 78, 2, 0, 2]
    answer = [0, 2, 2, 3, 4, 78]
    expect(bubble_sort(arr)).to eq (answer)
  end

end

describe "bubble_sort_by" do

  it "sorts the array by a certain criteria" do
    original_arr = ['hi', 'hello', 'hey']
    #result = bubble_sort_by(original_arr) { |a, b| b.length - a.length }
    result = bubble_sort_by(original_arr) { |a, b| a.length - b.length }
    answer = [ 'hi', 'hey', 'hello' ]

    expect(result).to eq (answer)
  end

end
