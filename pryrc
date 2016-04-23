Pry.config.editor = proc { |file, line| "dd status=none of=#{file}" }

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

load '~/.railsconsole' if defined?(Rails) && Rails.env
