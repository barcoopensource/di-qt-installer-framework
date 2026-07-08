#ifndef FRAMELESSMSGBOX_H
#define FRAMELESSMSGBOX_H

#include <QMessageBox>
#include <QMouseEvent>

class FramelessMsgBox : public QMessageBox
{
    Q_OBJECT
public:
    explicit FramelessMsgBox(QWidget *parent = nullptr);
    FramelessMsgBox(Icon icon, const QString &title, const QString &text,
                    StandardButtons buttons = Ok, QWidget *parent = nullptr);
    static StandardButton information(QWidget *parent,
                                      const QString &title,
                                      const QString &text,
                                      StandardButtons buttons = Ok,
                                      StandardButton defaultButton = NoButton);
    static StandardButton warning(QWidget *parent,
                                  const QString &title,
                                  const QString &text,
                                  StandardButtons buttons = Ok,
                                  StandardButton defaultButton = NoButton);
    static StandardButton critical(QWidget *parent,
                                   const QString &title,
                                   const QString &text,
                                   StandardButtons buttons = Ok,
                                   StandardButton defaultButton = NoButton);
    static StandardButton question(QWidget *parent,
                                   const QString &title,
                                   const QString &text,
                                   StandardButtons buttons = Ok | Cancel,
                                   StandardButton defaultButton = NoButton);

protected:
    void mousePressEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;
    void resizeEvent(QResizeEvent *event) override;

private:
    QPoint m_dragOffset;
    static StandardButton showDialog(QWidget *parent,
                                     Icon icon,
                                     const QString &title,
                                     const QString &text,
                                     StandardButtons buttons,
                                     StandardButton defaultButton);
    void initStyleSheet();
};

#endif
