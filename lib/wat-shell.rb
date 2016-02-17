module Wat
  VERSION = '0.0.1'

  def self.included(base)
    base.instance_eval do
      def respond_to_missing?(method, *args)
        `which #{method}` != ""
      end

      def method_missing(method, *args)
        if respond_to_missing?(method, *args)
          `#{method} #{args.join(' ')}`.split("\n")
        else
          [method, *args].join(' ')
        end
      end

      def Object.const_missing(const)
        const.to_s
      end
    end
  end
end

class String
  def -@
    "-#{self}"
  end

  def /(other)
    [self, other].join()
  end
end
