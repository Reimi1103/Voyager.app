class Notification < ApplicationRecord
  mount_uploader :eyecatch, ImagesUploader, dependent: :destroy
end
