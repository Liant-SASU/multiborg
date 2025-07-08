# frozen_string_literal: true

require "thor"
require_relative "config"

module Multiborg
  # CLI class for MultiBorg, providing command line interface to manage backups.
  class CLI < Thor
    desc "add BACKUP_NAME URI REPO_DESTINATION", "Add a backup with URI and repository destination to the backup list"
    def add(backup_name, uri, repo_destination)
      config = Config.new
      config.add_backup(backup_name, uri, repo_destination)
    end
    desc "remove BACKUP_NAME", "Remove a backup from the backup list"
    def remove(backup_name)
      config = Config.new
      config.remove_backup(backup_name)
    end
    desc "list", "List all backups to be managed"
    def list
      config = Config.new
      config.list_backups
    end
  end
end
