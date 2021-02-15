function taskmeta
task projects > taskprojs.txt && task tags > tasktags.txt && pr -m -T taskprojs.txt tasktags.txt && rm taskprojs.txt tasktags.txt
end
