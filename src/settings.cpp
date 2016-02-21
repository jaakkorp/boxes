#include "settings.h"

Settings::Settings(QObject *parent)
    : QSettings(QSettings::IniFormat,
      QSettings::UserScope,
      "jaakko",
      "boxes",
      parent)
{
}

bool Settings::contains(const QString &key) const
{
    return QSettings::contains(key);
}

QVariant Settings::value(const QString &key) const
{
    return QSettings::value(key);
}

void Settings::setValue(const QString &key, const QVariant &value)
{
    QSettings::setValue(key, value);
}

void Settings::setVariantList(const QString &key, const QVariantList &value)
{
    QSettings::setValue(key, value);
}
