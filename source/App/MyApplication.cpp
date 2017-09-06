#include <QApplication>
#include "Canvas.h"
#include "Dummy.h"

using namespace Jui;

int main(int argc, char** argv) {

	QApplication app(argc, argv);

	Canvas *win = new Canvas(200, 100, 400, 400);
	win->setName("JuiApp");
	HeaderWindow *headerWindow = new HeaderWindow(win);
	Edges *e1 = new Edges(win);
	
	return app.exec();
}