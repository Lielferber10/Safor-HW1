import random


def generate_pythagorean_triple():
    m = random.randint(2, 100)
    n = random.randint(1, m-1)
    a = m*m - n*n
    b = 2*m*n
    c = m*m + n*n
    return (a, b, c)

def generate_non_pythagorean_triple():
    while True:
        a = random.randint(1, 100)
        b = random.randint(1, 100)
        c = random.randint(1, 100)
        if a*a + b*b != c*c:
            return (a, b, c)

def generate_random_cezar_char():
    abc = 'abcdefghijklmnopqrstuvwxyz'
    ABC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    c = random.choice(abc + ABC)
    d = random.randint(1, 25)
    if c.islower():
        limit = ord('z') - ord(c)
        if d > limit:
            d = limit
    else:
        limit = ord('Z') - ord(c)
        if d > limit:
            d = limit
    shifted_c = chr(ord(c) + d)
    return (c, d, shifted_c)

import random

def generate_grades():
    avg_homework_score = random.randint(50, 100)
    exam_score = random.randint(0, 100)
    if exam_score >= 55:
        final_grade = round(0.8 * exam_score + 0.2 * avg_homework_score)
    else:
        final_grade = exam_score
    return (avg_homework_score, exam_score, final_grade)

def write_command_arguments_to_file(commandsArray, filename):
    # initialize the first row with 1
    resultArray = ['','','','','']

    # open the file for writing
    with open(filename, "a", encoding='utf-8') as file:
        # write the first n rows of the Pascal Triangle to the file
        for index, command in enumerate(commandsArray):
            if commandsArray[index] == 'P':
                if bool(random.getrandbits(1)):
                    (a, b, c) = generate_pythagorean_triple()
                    resultArray[index] = 'TRUE'
                    file.writelines(x+'\n' for x in (map(str,[a,b,c])))
                else:
                    (a, b, c) = generate_non_pythagorean_triple()
                    resultArray[index] = 'FALSE'
                    file.writelines(x+'\n' for x in (map(str,[a,b,c])))
            elif command == 'C':
                (c, d, shifted_c) = generate_random_cezar_char()
                resultArray[index] = shifted_c
                file.write(c + '\n')
                file.write(str(d) + '\n')
            elif command == 'G':
                (avg_homework_score, exam_score, final_grade) = generate_grades()
                resultArray[index] = str(final_grade)
                file.write(str(avg_homework_score)+'\n')
                file.write(str(exam_score)+'\n')
            else:
                print('an unexpected command ' + command + 'has been generated :(')
        return resultArray
def write_commands_to_file(filename):
    # initialize the first row with 0
    commandsArray = [0,0,0,0,0]
    for index, command in enumerate(commandsArray):
        commandsArray[index] = random.choice(['P','C','G'])
    # open the file for writing
    with open(filename, "w", encoding='utf-8') as file:
        for command in commandsArray:
            file.write(command+'\n')
            print(command + ' in ' + filename)
    return commandsArray

def write_results_to_file(resultArray, filename):
    with open(filename, "w", encoding='utf-8') as file:
        file.writelines(x+'\n' for x in resultArray[::-1])

def main():
    for n in range(30):
        filename = f"InputFiles/test{n}.in"
        commandArray = write_commands_to_file(filename)
        resultArray = write_command_arguments_to_file(commandArray, filename)
        
        filename = f"ExpectedFiles/test{n}.out"
        write_results_to_file(resultArray, filename)

if __name__ == "__main__":
    main()
