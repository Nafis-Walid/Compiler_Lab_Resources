#define UNDEF_TYPE 0
#define INT_TYPE 1
#define REAL_TYPE 2
#define CHAR_TYPE 3

char *typename[] = {"UNDEF_TYPE", "INT_TYPE", "REAL_TYPE", "CHAR_TYPE"};

typedef struct list_t
{
    char st_name[40];
    int st_type;
    
    struct list_t *next;    
}list_t;

void insert(char* name, int type);
/*
parameters: ID name, ID type
if ID is declared before
    prints error message
else
    inserts the ID to symbol table
returns: nothing
*/
list_t* search(char *name);
/*
parameter: ID name
returns: the location of the ID if found, NULL otherwise
*/
int idcheck(char* name);
/*
parameter: ID name
prints error message if ID is not found in symbol table
returns: 1(if ID is found in symbol table) 0(otherwise)
*/
int gettype(char *name);
/*
parameter: ID name
prints error message if ID is not declared
returns: the type of the ID, if not found then undefined(0) ID type
*/
int typecheck(int type1, int type2);
/*
parameter: ID_1 type, ID_2 type

if matches two ID type
    returns their ID type
else
    prints error message regarding two ID type does not match
    returns undefined(0) ID type
*/