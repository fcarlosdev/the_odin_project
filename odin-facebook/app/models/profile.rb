class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :picture,
      styles: { v_lg_img: "160x160#", lg_img: "75x75#",
                  md_img: "40x40#",   sm_img: "32x32#",
                v_sm_img: "19x19#" }

  validates_attachment :picture,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


end
