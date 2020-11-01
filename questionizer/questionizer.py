class Question:
    def __init__(self, oncul, soru, a, b, c, d, e):
        self.oncul = oncul
        self.soru = soru
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e


# Globals
# DO NOT CHANGE DELIMITOR EVER
delimitor = '#%$'

# Update this for each exam
examName = 'TUS-2018-1-TTBT'
fileName = '20181TTBT.txt'

# End Globals


questions = list()
questionLines = list()

tus = open(fileName, 'r', encoding='utf8')
lines = tus.readlines()

for line in lines:
    if line.strip() == '':
        if len(questionLines) == 0:
            continue
        oncul = ''
        soru = ''
        if(delimitor in questionLines[0]):
            splitted = questionLines[0].strip().split(sep=delimitor)
            oncul = splitted[0].strip()
            soru = splitted[1].strip()
        else:
            soru = questionLines[0].strip()

        questions.append(Question(oncul, soru, a=questionLines[1].strip(),
                                  b=questionLines[2].strip(), c=questionLines[3].strip(), d=questionLines[4].strip(), e=questionLines[5].strip()))
        questionLines.clear()
    else:
        questionLines.append(line)
tus.close()


csvLines = list()

count = 1
for q in questions:
    csvLines.append(examName + delimitor + str(count) + delimitor + q.oncul + delimitor + q.soru + delimitor + q.a + delimitor + q.b + delimitor + q.c + delimitor + q.d + delimitor + q.e + '\n')
    count = count + 1

fWriteCsv = open('output.txt', 'w', encoding='utf8')
for line in csvLines:
    fWriteCsv.write(line)
fWriteCsv.close()
