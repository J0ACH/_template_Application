#include <QApplication>
#include "MyClass.h"

using namespace MyNamespace;

int main(int argc, char** argv) {

	QApplication app(argc, argv);
	MyClass frame;
	return app.exec();
}