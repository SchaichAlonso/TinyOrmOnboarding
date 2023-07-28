#pragma once

#include <QtCore/QSharedPointer>
#include <QtTest>

#include <orm/db.hpp>
#include <orm/schema.hpp>

namespace MyNamespace
{
    struct MyTest : QObject
    {
        Q_OBJECT
            
    protected:
        static void demoTable(Orm::SchemaNs::Blueprint &table);

    private Q_SLOTS:
        void initTestCase();
        void cleanupTestCase();
        
        void init();
        void cleanup();

        void queryBuilder();
        void somethingElse();

    private:
        std::shared_ptr<Orm::DatabaseManager> m_db;
    };
}
