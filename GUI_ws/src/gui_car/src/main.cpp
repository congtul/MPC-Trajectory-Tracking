#include "include/main_window.h"
#include "q_node.h"

#include <QApplication>

int main(int argc, char** argv)
{
  QApplication a(argc, argv);
  Main_Window w(argc, argv);
  w.show();

  return a.exec();
}
