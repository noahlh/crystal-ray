module Enumerable(T)
  def reject_with_index(&block : T ->)
    ary = [] of T
    each_with_index { |e, i| ary << e unless yield e, i }
    ary
  end
end
