// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import mermaid from 'astro-mermaid';

// https://astro.build/config
export default defineConfig({
	integrations: [
		// Mermaid MUST come before Starlight
		mermaid(),
		starlight({
			title: 'EMPOWERED Visual',
			description: 'A visual learning companion for EMPOWERED by Marty Cagan',
			customCss: ['./src/styles/custom.css'],
			sidebar: [
				{ label: 'Book Overview', slug: 'overview' },
				{
					label: 'Part I: Lessons from Top Tech',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-01-lessons/overview' },
						{ label: 'Ch 1: Behind Every Great Company', slug: 'chapters/part-01-lessons/ch01-behind-great-company' },
						{ label: 'Ch 2: The Role of Technology', slug: 'chapters/part-01-lessons/ch02-role-of-technology' },
						{ label: 'Ch 3: Strong Product Leadership', slug: 'chapters/part-01-lessons/ch03-strong-leadership' },
						{ label: 'Ch 4: Empowered Product Teams', slug: 'chapters/part-01-lessons/ch04-empowered-teams' },
						{ label: 'Ch 5: Leadership in Action', slug: 'chapters/part-01-lessons/ch05-leadership-action' },
						{ label: 'Ch 6: A Guide to EMPOWERED', slug: 'chapters/part-01-lessons/ch06-guide-empowered' },
					],
				},
				{
					label: 'Part II: Coaching',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-02-coaching/overview' },
						{ label: 'Ch 7: The Coaching Mindset', slug: 'chapters/part-02-coaching/ch07-coaching-mindset' },
						{ label: 'Ch 8: The Assessment', slug: 'chapters/part-02-coaching/ch08-assessment' },
						{ label: 'Ch 9: The Coaching Plan', slug: 'chapters/part-02-coaching/ch09-coaching-plan' },
						{ label: 'Ch 10: The One-on-One', slug: 'chapters/part-02-coaching/ch10-one-on-one' },
						{ label: 'Ch 11: The Written Narrative', slug: 'chapters/part-02-coaching/ch11-written-narrative' },
						{ label: 'Ch 12: Strategic Context', slug: 'chapters/part-02-coaching/ch12-strategic-context' },
						{ label: 'Ch 13: Sense of Ownership', slug: 'chapters/part-02-coaching/ch13-ownership' },
						{ label: 'Ch 14-25: Deep Coaching Topics', slug: 'chapters/part-02-coaching/ch14-25-deep-topics' },
					],
				},
				{
					label: 'Part III: Staffing',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-03-staffing/overview' },
						{ label: 'Ch 26: Competence and Character', slug: 'chapters/part-03-staffing/ch26-competence-character' },
						{ label: 'Ch 27-36: Hiring & People Mgmt', slug: 'chapters/part-03-staffing/ch27-36-hiring' },
					],
				},
				{
					label: 'Part IV: Product Vision',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-04-vision/overview' },
						{ label: 'Ch 37: Creating a Compelling Vision', slug: 'chapters/part-04-vision/ch37-compelling-vision' },
						{ label: 'Ch 38-40: Sharing & Principles', slug: 'chapters/part-04-vision/ch38-40-sharing' },
					],
				},
				{
					label: 'Part V: Team Topology',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-05-topology/overview' },
						{ label: 'Ch 41: Optimizing for Empowerment', slug: 'chapters/part-05-topology/ch41-optimizing' },
						{ label: 'Ch 42: Team Types', slug: 'chapters/part-05-topology/ch42-team-types' },
						{ label: 'Ch 43-47: Platform & Experience', slug: 'chapters/part-05-topology/ch43-47-teams' },
					],
				},
				{
					label: 'Part VI: Product Strategy',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-06-strategy/overview' },
						{ label: 'Ch 48: Focus', slug: 'chapters/part-06-strategy/ch48-focus' },
						{ label: 'Ch 49: Insights', slug: 'chapters/part-06-strategy/ch49-insights' },
						{ label: 'Ch 50-52: Actions & Management', slug: 'chapters/part-06-strategy/ch50-52-actions' },
					],
				},
				{
					label: 'Part VII: Team Objectives',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-07-objectives/overview' },
						{ label: 'Ch 53: Empowerment', slug: 'chapters/part-07-objectives/ch53-empowerment' },
						{ label: 'Ch 54: Assignment', slug: 'chapters/part-07-objectives/ch54-assignment' },
						{ label: 'Ch 55-61: OKR Framework', slug: 'chapters/part-07-objectives/ch55-61-okrs' },
					],
				},
				{
					label: 'Part VIII: Case Study',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-08-casestudy/overview' },
						{ label: 'Full Case Study', slug: 'chapters/part-08-casestudy/full-case' },
					],
				},
				{
					label: 'Part IX: Business Collaboration',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-09-collaboration/overview' },
						{ label: 'Stakeholder & Evangelism', slug: 'chapters/part-09-collaboration/stakeholder-evangelism' },
					],
				},
				{
					label: 'Part X: Transformation',
					items: [
						{ label: 'Part Overview', slug: 'chapters/part-10-transformation/overview' },
						{ label: 'The Journey', slug: 'chapters/part-10-transformation/journey' },
					],
				},
				{
					label: 'Core Concepts',
					autogenerate: { directory: 'concepts' },
				},
				{
					label: 'Learning Paths',
					autogenerate: { directory: 'paths' },
				},
			],
		}),
	],
});
