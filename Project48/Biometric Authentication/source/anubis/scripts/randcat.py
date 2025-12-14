#!/usr/bin/python
import sys, glob, operator, getopt, random

def stdin_to_list():
    lines= []
    while 1:
        line= sys.stdin.readline()
        if not line:
            break
        lines.append(line)
    return lines

def rand_num_cat(num):
    lines= stdin_to_list()
        
    choose_lines= []
    choose= 0

    while ( choose < num and len(lines) != 0 ):
        elem= random.choice(lines)
        lines.remove(elem)
        choose_lines.append(elem)
        choose+= 1
        
    for i in choose_lines:
        sys.stdout.write(i)

def rand_prob_cat(prob, num):
    """
    @prob: probability (percentage)
    @num : choose maximam numbers
    """
    lines= stdin_to_list()
    
    
    pass



if __name__ == '__main__':
    def usage_and_exit():
        print "choose nubers of lines randomly\n"
        print "-?, -h\n\t show this message"
        print "-n, --number= num\n\t numbers elements random choise and cat"
        #print "-p, --probability= percentage\n\t random cat by percentage (now writing)"
        sys.exit(0)

    try:
        opts, args = getopt.getopt(sys.argv[1:], "?:h:p:n:", ["help","probablity=", "number="])

    except getopt.GetoptError:
        usage_and_exit()

    probability= None
    number= None

    for (k, v) in opts:
        if   k in ("-?","-h") : usage_and_exit()
        elif k in ("-n","--number") : number= int(v)
        elif k in ("-p","--probability") : probability= float(v)

    if number and not probability:
        rand_num_cat(number)
