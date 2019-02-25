module.exports = (robot) ->
  robot.respond /mom (.*)/i,(res) ->
    input = res.match[1]


    xls = require 'xlsx'
    workbook = xls.readFile('C:\\Users\\pbuddaraju\\bot\\scripts\\hubot.xlsx')
    #sheet = table.Sheets[table.sheetNames[0]]
    sheet_name_list = workbook.SheetNames[0];
    worksheet = workbook.Sheets[sheet_name_list]
    #range = xls.utils.decode_range(sheet['!ref'])
    excelRows = xls.utils.sheet_to_row_object_array(workbook.Sheets[sheet_name_list])
    val = (xls.utils.sheet_to_json(workbook.Sheets[sheet_name_list]))
    #for(rowNum = range.s.r; rowNum <= range.e.r; rowNum++)
    #console.log (JSON.stringify(val))
    for i in val
      if i['Scrum date'] is input
        out = (i['MOM'])
      else
        continue
    res.send "Moments of Meeting: #{(out)}"
