# Creates a makefile and a main class file template.

generateMakefile(){
echo "$projectName.x : main.o
        g++ -g main.o -o $projectName.x

main.o:
        g++ -g -c main.cpp

run:
        ./$projectName.x

debug:
        g++ -g main.cpp

clean:
        rm $projectName.x" > makefile
}
generateCppMainTemplate(){
echo "#include<iostream>
using namespace std;

int main()
{

        return 0;
}" > main.cpp
}
generateJavaMainTemplate(){
echo "public class main{
	public static void main(String[] args){

	}
}" > main.java
}

echo "What type of project do you want to generate? "
echo "1) Java"
echo "2) CPP"
echo "Enter a number"
read projectType
echo "What is the project or lab name?"
read projectName
if [ "$projectType" == "2" ]; then
	generateCppMainTemplate
	generateMakefile
elif [ "$projectType" == "1" ]; then
	generateJavaMainTemplate
fi
git init
git add .
git commit -m "First Commit!"
