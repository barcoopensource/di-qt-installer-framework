#include "framelessmsgbox.h"
#include <QPushButton>
#include <QFont>

#ifdef _WIN32
#include <dwmapi.h>
#endif

FramelessMsgBox::FramelessMsgBox(QWidget *parent)
    : QMessageBox(parent)
{
    setWindowFlags(Qt::Dialog | Qt::FramelessWindowHint);
    setAttribute(Qt::WA_StyledBackground, true);

    setIcon(QMessageBox::NoIcon);

#ifdef _WIN32
    HWND hwnd = reinterpret_cast<HWND>(winId());
    MARGINS shadowMargin = {10, 10, 10, 10};
    DwmExtendFrameIntoClientArea(hwnd, &shadowMargin);
#endif
}

FramelessMsgBox::FramelessMsgBox(Icon icon, const QString &title, const QString &text,
                       StandardButtons buttons, QWidget *parent)
    : FramelessMsgBox(parent)
{
    setWindowFlags(Qt::Dialog | Qt::FramelessWindowHint);
    setAttribute(Qt::WA_StyledBackground, true);
    setIcon(QMessageBox::NoIcon);
    setText(title);
    setInformativeText(text);
    setStandardButtons(buttons);
}

QMessageBox::StandardButton FramelessMsgBox::question(QWidget *parent,
                                                      const QString &title,
                                                      const QString &text,
                                                      StandardButtons buttons,
                                                      StandardButton defaultButton)
{
    return showDialog(parent, QMessageBox::Question, title, text, buttons, defaultButton);
}

QMessageBox::StandardButton FramelessMsgBox::information(QWidget *parent,
                                                         const QString &title,
                                                         const QString &text,
                                                         StandardButtons buttons,
                                                         StandardButton defaultButton)
{
    return showDialog(parent, QMessageBox::Information, title, text, buttons, defaultButton);
}

QMessageBox::StandardButton FramelessMsgBox::warning(QWidget *parent,
                                                     const QString &title,
                                                     const QString &text,
                                                     StandardButtons buttons,
                                                     StandardButton defaultButton)
{
    return showDialog(parent, QMessageBox::Warning, title, text, buttons, defaultButton);
}

QMessageBox::StandardButton FramelessMsgBox::critical(QWidget *parent,
                                                      const QString &title,
                                                      const QString &text,
                                                      StandardButtons buttons,
                                                      StandardButton defaultButton)
{
    return showDialog(parent, QMessageBox::Critical, title, text, buttons, defaultButton);
}

QMessageBox::StandardButton FramelessMsgBox::showDialog(QWidget *parent,
                                                        Icon icon,
                                                        const QString &title,
                                                        const QString &text,
                                                        StandardButtons buttons,
                                                        StandardButton defaultButton)
{
    FramelessMsgBox box(parent);
    box.setText(title);
    box.setInformativeText(text);
    box.setStandardButtons(buttons);

    if (defaultButton != NoButton) {
        box.setDefaultButton(defaultButton);
    }

    if (auto *ok = box.button(QMessageBox::Ok)) {
        ok->setObjectName("okButton");
    }
    if (auto *cancel = box.button(QMessageBox::Cancel)) {
        cancel->setObjectName("cancelButton");
    }

    return static_cast<StandardButton>(box.exec());
}

void FramelessMsgBox::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        m_dragOffset = event->globalPos() - frameGeometry().topLeft();
        event->accept();
    }
}

void FramelessMsgBox::mouseMoveEvent(QMouseEvent *event)
{
    if (event->buttons() & Qt::LeftButton)
    {
        move(event->globalPos() - m_dragOffset);
        event->accept();
    }
}

void FramelessMsgBox::resizeEvent(QResizeEvent *event)
{
    QMessageBox::resizeEvent(event);
    if (width() < 420)
    {
        setMinimumWidth(420);
    }
}