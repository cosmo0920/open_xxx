# -*- coding: utf-8 -*-
# twitter Webを開く

Plugin.create :open_twitter do
    command(:open_twitter,
      name: 'この人のtwitterを見る',
      show_face: Proc.new{ |m|
          u = if(m.messages.first.message[:retweet])
                m.messages.first.message[:retweet].user
              else
                m.messages.first.message.user end
          "#{u[:idname]}さんのtwitterへ".gsub(/_/, '__') },
      condition: Plugin::Command[:CanReplyAll],
      visible: true,
      role: :timeline) do |opt|
        Gtk::openurl("https://twitter.com/#{opt.messages.first.message.idname}")
  end
end
