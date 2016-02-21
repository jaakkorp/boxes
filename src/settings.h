#ifndef SETTINGS_H
#define SETTINGS_H

#include <QSettings>

class Settings : public QSettings
{
    Q_OBJECT

public:
    Settings(QObject *parent = nullptr);

    Q_INVOKABLE bool contains(const QString &key) const;
    Q_INVOKABLE QVariant value(const QString &key) const;
    Q_INVOKABLE void setValue(const QString &key, const QVariant &value);
    Q_INVOKABLE void setVariantList(const QString &key, const QVariantList &value);
};

#endif // SETTINGS_H
