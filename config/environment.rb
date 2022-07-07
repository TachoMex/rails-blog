# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
# Initialize the Rails application.
KybusSchema = Kybus::Nanorecord.load_schema!('./config/nanorecord.yml')
KybusSchema.build_classes!

Rails.application.initialize!
