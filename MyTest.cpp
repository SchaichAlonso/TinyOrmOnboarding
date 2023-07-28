#include "MyTest.hpp"

namespace MyNamespace
{
	void MyTest::initTestCase()
	{
		qDebug() << "init";

		m_db = Orm::DB::create(
			QVariantHash{
				{"driver",                  "QSQLITE"},
				{"database",                qEnvironmentVariable("DB_DATABASE", "example.sqlite3")},
				{"foreign_key_constraints", qEnvironmentVariable("DB_FOREIGN_KEYS", "true")},
				 /*
				  * check_database_exists defaults to true and preempts implicit database creation
				  */
				{"check_database_exists",   false},
				{"qt_timezone",             QVariant::fromValue(Qt::UTC)},
				{"return_qdatetime",        true},
				{"prefix",                  ""}
			}
		);
	}

	void MyTest::cleanupTestCase()
	{
		qDebug() << "cleanup";

		m_db.reset();
	}

	void MyTest::demoTable(Orm::SchemaNs::Blueprint &table)
	{
		table.id();
		table.integer("a");
		table.Float("b");
	}

	void MyTest::init()
	{
		try {
			Orm::Schema::create("demoTable", demoTable);
		} 
		catch (const std::exception& ex) {
			qCritical() << ex.what();
		}
	}

	void MyTest::cleanup()
	{
		try {
			Orm::Schema::drop("demoTable");
		}
		catch (const std::exception& ex) {
			qCritical() << ex.what();
		}
	}

	void MyTest::queryBuilder()
	{
		try {
			Orm::DB::table("demoTable")->insert({
				QVariantMap{{"a", 3}, {"b", 5}},
				QVariantMap{{"a", 1}, {"b", 4.5}}
			});

			Orm::SqlQuery rows(Orm::DB::table("demoTable")->get());
			QCOMPARE(rows.size(), 2);
		} catch (const std::exception& ex) {
			QVERIFY(false);
			qCritical() << ex.what();
		}
	}
	
	void MyTest::somethingElse()
	{
		qDebug() << "somethingElse";
		QVERIFY(true);
	}
}

QTEST_MAIN(MyNamespace::MyTest);