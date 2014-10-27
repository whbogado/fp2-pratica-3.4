Feature: Avalia a Prática 3.4 de IF62C-Fundamentos de Programação 2
    Como professor da disciplica de Fundamentos de Programação 2
    Quero avaliar a prática 3.4
    A fim de verificar a compreensão dos estudantes

    Background:
        Given the maximum grade is 100
        Given the main class is 'Pratica34'
        Given I set the script timeout to 3000
        Given I evaluate 'import utfpr.ct.dainf.grader.*'
        Given I evaluate 'import java.util.regex.*'
    
    Scenario: Verifica se a classe Pratica34 classe existe no pacote padrão e contem o método main (10 pontos)
        Given I report 'Iniciando avaliação...'
        Given I report 'Avaliando item 3...'
        Given class 'Pratica34' exists somewhere store class in <mainClass>
        Given the class <mainClass> is in the 'default' package
        And class <mainClass> has 'public' modifier
        Then award 5 points
        Given class <mainClass> declares 'main(java.lang.String[])' method save in <mainMethod>
        And method <mainMethod> returns type 'void'
        And member <mainMethod> has 'public' modifier
        And member <mainMethod> has 'static' modifier
        Then award 5 points

    Scenario: Verifica se o método fatorial foi corretamente implementado (20 pontos)
        Given I report 'Avaliando item 4...'
        Given class <mainClass> declares 'fatorial(int)' method save in <fatorialMethod>
        And member <fatorialMethod> has 'public' modifier
        And member <fatorialMethod> has 'static' modifier
        And method <fatorialMethod> returns type 'long'
        Then award 5 points
        Given I evaluate 'int nTest = TestUtils.random(2, 8)'
        And expression 'TestUtils.fatorialTest(nTest) == Pratica34.fatorial(nTest)' evaluates to <true>
        Then award 15 points

    Scenario: Verifica se exibe os fatoriais calculados (30 pontos)
        Given I report 'Avaliando item 5...'
        Given I evaluate 'testMain = new Pratica34()'
        Given I set output to <testOut>
        And I evaluate 'testMain.main(new String[0])'
        And I set output to <default>
        Then award 10 points
        Given I evaluate 'fRegex1 = ".*" + TestUtils.fatorialTest(TestUtils.random(0,9)) + ".*"'
        Given I evaluate 'fRegex2 = ".*" + TestUtils.fatorialTest(TestUtils.random(10,18)) + ".*"'
        Given I evaluate 'fRegex3 = ".*" + TestUtils.fatorialTest(19) + ".*"'
        And <testOut> matches regex <fRegex1> with 'Pattern.DOTALL' option
        And <testOut> matches regex <fRegex2> with 'Pattern.DOTALL' option
        And <testOut> matches regex <fRegex3> with 'Pattern.DOTALL' option
        Then award 20 points

    Scenario: Verifica se o método mdc foi corretamente implementado (30 pontos)
        Given I report 'Avaliando item 6...'
        Given class <mainClass> declares 'mdc(int,int)' method save in <mdcMethod>
        And member <mdcMethod> has 'public' modifier
        And member <mdcMethod> has 'static' modifier
        And method <mdcMethod> returns type 'int'
        Then award 10 points
        Given I evaluate 'nTest = TestUtils.random(1, 99);int mTest = TestUtils.random(100, 199);'
        And expression 'TestUtils.mdcTest(nTest, mTest) == Pratica34.mdc(nTest, mTest)' evaluates to <true>
        Then award 20 points

    Scenario: Verifica se exibe o valor calculado (10 pontos)
        Given I report 'Avaliando item 7...'
        Given I evaluate 'testMain = new Pratica34()'
        Given I set output to <testOut>
        And I evaluate 'testMain.main(new String[0])'
        And I set output to <default>
        Given I evaluate 'mRegex1 = ".*" + TestUtils.mdcTest(12,24) + ".*"'
        Given I evaluate 'mRegex2 = ".*" + TestUtils.mdcTest(5,7) + ".*"'
        And <testOut> matches regex <mRegex1> with 'Pattern.DOTALL' option
        And <testOut> matches regex <mRegex2> with 'Pattern.DOTALL' option
        Then award 10 points

    Scenario: Report final grade.
        Given I report grade formatted as 'FINAL GRADE: %.1f'
