# -*- coding: utf-8 -*-
# favotterを開く

Plugin.create :open_favstar do
    command(:open_favotter,
      name: 'この人のfavotterを見る',
      condition: Plugin::Command[:CanReplyAll],
      visible: true,
      role: :timeline) do |opt|
        Gtk::openurl("http://favotter.net/user/#{opt.messages.first.message.idname}&mode=new")
  end
end
