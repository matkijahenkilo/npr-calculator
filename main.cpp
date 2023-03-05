#include <iostream>
#include <string>

using namespace std;

#define ASCII_OFFSET 48

struct Pilha {
    char vetor[5];
    int n = 0;
};

void push(Pilha *p, char resultado) {
    p->vetor[p->n] = resultado;
    p->n++;
}

char pop(Pilha *p) {
    p->n--;
    return p->vetor[p->n];
}

int contagemString(string s) {
    int i = 0;

    while (s[i] != '\0') {
        i++;
    }

    return i+1;
}

void calcularNaPilha(Pilha *p, char operador) {
    switch (operador) {
    case '+':
        push(p, pop(p) + pop(p));
        break;
    case '-':
        push(p, pop(p) - pop(p));
        break;
    case '*':
        push(p, pop(p) * pop(p));
        break;
    case '/':
        push(p, pop(p) / pop(p));
        break;
    }
}

bool isThisNumber(char expression) {
    if (expression == '+' || expression == '-' || expression == '*' || expression == '/') {
        return false;
    } else {
        return true;
    }
}

int transformarParaInt(char c) {
    return c - ASCII_OFFSET;
}

int NPR(Pilha *p, string expression, int total) {
    for (int i = 0; i < total; i++) {
        if (i%2 == 0) {
            if (isThisNumber(expression[i])) {
                push(p, transformarParaInt(expression[i]));
            } else {
                calcularNaPilha(p, expression[i]);
            }
        }
    }

    if (!p->n) {
        cout << "A expressão estava errada." << endl;
        return 0;
    } else {
        return pop(p);
    }
}

int main() {
    Pilha *p = new Pilha;

    string expression;
    cout << "digite a expressão em NPR. Exemplo: \"2 3 * 4 +\"" << endl;
    getline(cin, expression);

    cout << "resultado: " << NPR(p, expression, contagemString(expression)) << endl;

    delete(p);

    return 0;
}
