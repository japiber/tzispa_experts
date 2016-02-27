# frozen_string_literal: true

require 'mini_magick'

module Tzispa
  module Experts
    module Image

      def resize_crop_image(source:, image_size: nil, dest_file: nil, qualiy: 90, crop: false)
        image_file = dest_file || source
        if image_size && MiniMagick::Tool::Convert.new do |convert|
            convert.merge! [source, '-resize', image_size, "-quality", "#{qualiy}", image_file]
          end
        end
        if crop
          crop_info = MiniMagick::Tool::Convert.new do |convert|
            convert.merge! [image_file, "-virtual-pixel", " edge", "-blur", "0x15", "-fuzz", "15%", "-trim", "-format", "'%[fx:w+72]x%[fx:h+72]+%[fx:page.x-10]+%[fx:page.y-10]'", "info:" ]
          end if crop
          MiniMagick::Tool::Convert.new do |convert|
            convert.merge! [ image_file, "-crop", "#{crop_info.delete("'")}", "+repage", "-strip", "-interlace", "Plane", "-gaussian-blur", "0.05", image_file ]
          end
        end
      end

      def request_upload_image(param:, path:, save_as: nil, keep_ext: true, crop: false, size: nil)
        if result = request_upload_file( param: param, path: path, save_as: save_as, keep_ext: keep_ext )
          resize_crop_image( source: result[:path], image_size: size ) if crop
        end
        result
      end


    end
  end
end
