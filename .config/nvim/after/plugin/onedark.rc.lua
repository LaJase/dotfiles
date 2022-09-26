local status, onedark = pcall(require, "onedark")
if (not status) then return end

onedark.setup({
  style = 'darker',
  colors = {
    light_grey = "#7a818e",
    orange = "#cc9057",
    yellow = "#e2b86b",
    red = "#e55561",
    bg3 = "#3b3f4c",

  },
  highlights = {
    TSTag = { fg = '$light_grey' },
    TSTagAttribute = {fg = '$orange' },
    TSTagDelimiter = { fg = '$light_grey' },
    TSVariable = {fg = '$yellow'},
    TSParameterReference = {fg = '$red'},
    TSProperty = {fg = '$red'},
    TSCharacterSpecial = {fg = '$light_grey'},
    TSPunctSpecial = { fg = '$light_grey'},

    -- To enable illminate
    illuminatedWord = { bg = '$bg3' },
    illuminateCurWord = { bg = '$bg3' },
  },
})

onedark.load()
