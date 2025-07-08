# frozen_string_literal: true

require "yaml"

module Multiborg
  # Class managing the configuration for MultiBorg.
  class Config
    CONFIG_PATH = File.expand_path("~/.config/multiborg.yml")

    def initialize
      @config = load_config
    end

    # Load the configuration from the YAML file.
    def load_config
      if File.exist?(CONFIG_PATH)
        YAML.load_file(CONFIG_PATH)
      else
        { "backups" => [] }
      end
    end

    # Save the configuration to the YAML file.
    def save
      File.open(CONFIG_PATH, "w") do |file|
        file.write(@config.to_yaml)
      end
    end

    # Add a backup with URI and repository destination to the configuration.
    def add_backup(backup_name, uri, repo_destination)
      if @config["backups"].any? { |backup| backup["name"] == backup_name }
        puts "Backup already exists: #{backup_name}"
      else
        @config["backups"] << { "name" => backup_name, "uri" => uri, "repo_destination" => repo_destination }
        save
        puts "Added backup: #{backup_name} with URI: #{uri} and repository destination: #{repo_destination}"
      end
    end

    # Remove a backup from the configuration.
    def remove_backup(backup_name)
      if @config["backups"].any? { |backup| backup["name"] == backup_name }
        @config["backups"].delete_if { |backup| backup["name"] == backup_name }
        save
        puts "Removed backup: #{backup_name}"
      else
        puts "Backup not found: #{backup_name}"
      end
    end

    # List all backups in the configuration.
    def list_backups
      if @config["backups"].any?
        puts "Backups to be managed:"
        @config["backups"].each do |backup|
          puts " - Name: #{backup["name"]}, URI: #{backup["uri"]}, Repository: #{backup["repo_destination"]}"
        end
      else
        puts "No backups to be managed."
      end
    end
  end
end
