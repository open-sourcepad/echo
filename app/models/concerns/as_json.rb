module Concerns
  module AsJson
    def only_attributes
      self.attributes.keys
    end

    def methods_list
      []
    end

    def as_json(**options)
      options.symbolize_keys!
      only_attr = only_attributes | Array(options[:only])
      methods = methods_list | Array(options[:methods])
      super(only: only_attr, methods: methods, **options)
    end
  end
end
