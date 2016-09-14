$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '../lib'))

require 'minitest'
require 'minitest/autorun'

require 'ruby_dig2'

class RubyDig2Test
  class Diggable
    def dig2(*keys)
      keys
    end
  end

  describe RubyDig2 do
    describe "Array" do
      it "digs an array by index" do
        assert_equal 'one', ['zero', 'one', 'two'].dig2(1)
      end

      it "digs a nested array by index" do
        assert_equal 'twelve', ['zero', ['ten', 'eleven', 'twelve'], 'two'].dig2(1, 2)
      end

      it "raises TypeError when nested array doesn't support dig2" do
        assert_raises(TypeError) { ['zero', 'one', 'two'].dig2(1, 2) }
      end

      it "returns nil when dig not found" do
        assert_equal nil, ['zero', 'one', 'two'].dig2(4)
      end

      it "raises TypeError when dig index not an integer" do
        assert_raises(TypeError) { ['zero', 'one', 'two'].dig2(:four) }
      end

      it "digs into any object that implements dig2" do
        assert_equal [:a, :b], [0, Diggable.new].dig2(1, :a, :b)
      end

      it "returns the value false" do
        assert_equal false, [:a, [true, false]].dig2(1, 1)
      end
    end

    describe "Hash" do
      it "digs a hash by key" do
        assert_equal 'Homer', {first: "Homer", last: "Simpson"}.dig2(:first)
      end

      it "digs a nested hash by keys" do
        assert_equal 'Homer', {mom: {first: "Marge", last: "Bouvier"}, dad: {first: "Homer", last: "Simpson"}}.dig2(:dad, :first)
      end

      it "raises TypeError when nested hash doesn't support dig2" do
        assert_raises(TypeError) { {mom: {first: "Marge", last: "Bouvier"}, dad: "Homer Simpson"}.dig2(:dad, :first) }
      end

      it "returns nil when dig not found" do
        assert_equal nil, {first: "Homer", last: "Simpson"}.dig2(:middle)
      end

      it "digs into any object that implements dig2" do
        assert_equal [:a, :b], {diggable: Diggable.new}.dig2(:diggable, :a, :b)
      end

      it "returns the value false" do
        assert_equal false, {first: "Homer", last: "Simpson", sobber: false}.dig2(:sobber)
      end
    end

    describe "Nested Hash and Array" do
      it "navigates both" do
        assert_equal 'Lisa', {mom: {first: "Marge", last: "Bouvier"},
                              dad: {first: "Homer", last: "Simpson"},
                              kids: [{first: "Bart"}, {first: "Lisa"}]}.dig2(:kids, 1, :first)
      end
    end
  end
end
