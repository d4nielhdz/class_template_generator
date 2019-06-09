#!/bin/bash
# March 4th, 2019

echo "#ifndef $1_h" > $1.h
echo "#define $1_h" >> $1.h

echo "#include <iostream>" >> $1.h
echo "using namespace std;" >> $1.h

echo " " >> $1.h

echo "// Class definition " >> $1.h

echo "class $1 {" >> $1.h

echo " " >> $1.h

echo "// Private attributes " >> $1.h
printf "    private: \n" >> $1.h
c=1
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        echo "$i;" >> $1.h
    else
        printf "        $i " >> $1.h
    fi
    c=$((c+1))
done
echo " " >> $1.h
echo "// Public methods " >> $1.h
printf "    public: \n" >> $1.h
echo "// Constructor " >> $1.h
printf "        $1(); \n" >> $1.h
echo "//Getters " >> $1.h
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        
        echo "$i(); " >> $1.h
    else
        
        printf "    $i get_" >> $1.h
    fi
    c=$((c+1))
done
prev=""
echo "//Setters " >> $1.h
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        printf "        void set_$i($prev); \n" >> $1.h

    else
        
        prev=$i
        
    fi
    c=$((c+1))
done
echo "// ToString Method " >> $1.h
printf "        void to_string(); \n" >> $1.h

echo "}; " >> $1.h

echo " " >> $1.h

echo "// Constructor initializes attributes to 0 by default " >> $1.h
echo "$1::$1() {" >> $1.h
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        printf "    $i= 0; \n" >> $1.h
    fi
    c=$((c+1))
done

echo "}" >> $1.h

echo " " >> $1.h
echo "// Getters " >> $1.h
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        echo "$prev $1::get_$i() { return $i; }" >> $1.h
        

    else
        
        prev=$i
    fi
    c=$((c+1))
done

echo " " >> $1.h
echo "//Setters " >> $1.h
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        echo "void $1::set_$i($prev new_$i) { $i= new_$i; }" >> $1.h

    else
        
        prev=$i
    fi
    c=$((c+1))
done

echo " " >> $1.h
echo "// To_string " >> $1.h
echo "void $1::to_string() {" >> $1.h

for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        echo "  cout << \"$i\" << $i << endl; " >> $1.h
    fi
    c=$((c+1))
done

echo "}" >> $1.h

echo " " >> $1.h

echo "#endif" >> $1.h
