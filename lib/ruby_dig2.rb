module RubyDig2
  def dig2(key, *rest)
    value = self[key]
    if value.nil? || rest.empty?
      value
    elsif value.respond_to?(:dig2)
      value.dig2(*rest)
    else
      fail TypeError, "#{value.class} does not have #dig2 method"
    end
  end
end

class Array
  include RubyDig2
end
class Hash
  include RubyDig2
end
