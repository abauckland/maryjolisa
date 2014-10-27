class ConvertPasswordsToAuthlogicSha512 < ActiveRecord::Migration
  def up
    User.transaction do
      User.find_each do |user|
        user.password = "demo1234"
        user.password_confirmation = "demo1234"

        user.save!
      end
    end

    say %q{All users have had their password reset to "demo1234"}
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "can't recover old passwords"
  end
end
