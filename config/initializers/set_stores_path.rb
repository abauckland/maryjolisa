STORES_PATH = if Rails.env.production?
  Pathname.new("/home/manager/apps/myhq-stores")
else
  Rails.root.join("..", "myhq-stores")
end
