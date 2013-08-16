# -*- coding: utf-8 -*-
# twitter Webを開く
Plugin.create :open_twilog do
    command(:open_twilog,
      name: 'この人のtwilogを見る',
      condition: Proc.new{ |m|
          u = if(m.messages.first.message[:retweet])
                m.messages.first.message[:retweet].user
              else
                m.messages.first.message.user end
          "#{u[:idname]}さんのtwilogへ".gsub(/_/, '__') },
      visible: true,
      role: :timeline) do |opt|
        Gtk::openurl("http://twilog.org/#{opt.messages.first.message.idname}")
  end
end
