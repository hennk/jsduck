require "jsduck/tag/tag"
require "jsduck/ast_utils"

module JsDuck::Tag
  class Requires < Tag
    def initialize
      @pattern = "requires"
      @ext_define_pattern = "requires"
      @ext_define_default = {:requires => []}
    end

    # @requires classname1 classname2 ...
    def parse(p)
      p.add_tag(:requires)
      p.classname_list(:requires)
    end

    def parse_ext_define(cls, ast)
      cls[:requires] = JsDuck::AstUtils.make_string_list(ast)
    end
  end
end