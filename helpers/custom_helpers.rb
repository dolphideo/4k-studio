def main_menu_item(name, link, description)
  link_to "#{name}<span><span class='hidden-desktop'>-</span>#{description}</span>", link
end
