#import <Foundation/Foundation.h>

// Macros: Definen objetos y funciones para el pre-compilador

#define PI 3.14159
#define RAD_TO_DEG(radians) (radians * (180/PI))

// Structs: Definen un objeto de tan solo variables, no metodos

typedef struct colores {
    unsigned char r;
    unsigned char v;
    unsigned char a;
};

// Enums: Son un conjunto de constantes relacionadas

typedef enum modelos { 
    LEXUS,
    SUZUKI,
    BMW,
    FORD
};

int main(int argc, char const *argv[]) {
    
    @autoreleasepool {
        double angulo = PI / 2;
        NSLog(@"%f", RAD_TO_DEG(angulo));

        // Typedef: Crean un tipo de dato a partir de uno ya existente
        
        typedef unsigned char Color;

        Color rojo  = 255;
        Color verde = 234;
        Color azul  = 111;

        NSLog(@"Los colores son (R: %hhu, G: %hhu, B: %hhu)",
            rojo, verde, azul);

        colores c = {201, 153, 037};
        NSLog(@"Los nuevos colores son (R: %hhu, G: %hhu, B: %hhu)", 
            c.r, c.v, c.a);

        modelos miCarro = SUZUKI;

        switch (miCarro) {
            case LEXUS:
            case SUZUKI:
                NSLog(@"Es Japones");
                break;
            case BMW:
            case FORD:
                NSLog(@"Es del occidente");
                break;
            default:
                break;
        }

        // Pointers: Son referencias a posiciones en memoria.
        // '&' se utiliza para obtener direccion en memoria de una variable
        // '*' se utiliza para obtener o asignar valor a una posicion en memoria

        char modelos[6] = { 's','u','z','u','k','i' };
        char *punteroM  = &modelos[0];

        for (int i = 0; i < 6; i++) {
            NSLog(@"La posicion en memoria es %p, el valor es %c", 
                punteroM, &punteroM);
            punteroM++;
        }

        // NULL: Se utiliza para designar que un puntero ya no tiene valor,
        // esta vacio, lo que es distinto a '0' porque '0' sigue siendo un
        // Valor valido. NULL es un macro definido en C

        punteroM = NULL;

        // void: Se utiliza para definir punteros genericos. Para llevarlo a
        // un tipo de dato especifico, se debe de castear.

        int tiempo = 24;
        void *pointerVoid = &tiempo;
        int *pointerInt = (int *) pointerVoid;

        NSLog(@"El valor del puntero es: %d", *pointerInt);
    }
    return 0;
}