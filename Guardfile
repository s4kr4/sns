group :frontend do
  #guard :bundler do
  #  watch('Gemfile')
  #end

  guard :livereload do
    watch(%r{^app/.+\.(erb|haml|slim)})
    watch(%r{^app/helpers/.+\.rb})
    watch(%r{^public/.+\.(css|js|html)})
  end
end

group :backend do
  guard :rspec, :version => 2, :cli => "--color --drb -r rspec/instafail -f RSpec::Instafail" do
    watch('spec/spec_helper.rb')                                               { "spec" }
    watch('app/controllers/application_controller.rb')                         { "spec/controllers" }
    watch('config/routes.rb')                                                  { "spec/routing" }
    watch(%r{^spec/support/(requests|controllers|mailers|models)_helpers\.rb}) { |m| "spec/#{m[1]}" }
    watch(%r{^spec/.+_spec\.rb})

    watch(%r{^app/controllers/(.+)_(controller)\.rb})                          { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }

    watch(%r{^app/(.+)\.rb})                                                   { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^lib/(.+)\.rb})                                                   { |m| "spec/lib/#{m[1]}_spec.rb" }
  end
end

