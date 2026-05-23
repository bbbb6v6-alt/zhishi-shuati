import { pgTable, serial, integer, text, boolean, timestamp, varchar } from "drizzle-orm/pg-core"
import { sql } from "drizzle-orm"



export const wrongQuestions = pgTable("wrong_questions", {
	id: serial().primaryKey().notNull(),
	questionId: integer("question_id").notNull(),
	userAnswer: text("user_answer"),
	isWrong: boolean("is_wrong").default(true),
	answeredAt: timestamp("answered_at", { mode: 'string' }).defaultNow(),
});

export const healthCheck = pgTable("health_check", {
	id: serial().notNull(),
	updatedAt: timestamp("updated_at", { withTimezone: true, mode: 'string' }).defaultNow(),
});

export const questions = pgTable("questions", {
	id: serial().primaryKey().notNull(),
	type: varchar({ length: 20 }).notNull(),
	question: text().notNull(),
	options: text(),
	answer: text().notNull(),
	explanation: text().notNull(),
	difficulty: integer().default(1),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow(),
});
