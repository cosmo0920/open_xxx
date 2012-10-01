# -*- coding: utf-8 -*-
# twitter Webを開く

Plugin.create :open_twitter do
    command(:open_twitter,
      name: 'この人のtwitterを見る',
      condition: Proc.new{ |m|
          u = if(m.messages.first.message[:retweet])
                m.messages.first.message[:retweet].user
              else
                m.messages.first.message.user end
          "#{u[:idname]}さんのtwitterへ".gsub(/_/, '__') },
      visible: true,
      role: :timeline) do |opt|
        Gtk::openurl("http://twitter.com/#{opt.messages.first.message.idname}")
  end
end
