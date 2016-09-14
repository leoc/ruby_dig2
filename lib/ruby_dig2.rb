module RubyDig2
  def dig2(key, *rest)
    value =
      if key.is_a?(Hash)
        detect do |e| 
          key.all? { |k, v| e[k] == v }
        end
      else
        self[key]
      end
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
