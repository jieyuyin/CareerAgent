import { Navigate, Route, Routes } from 'react-router-dom'
import DevAgentPage from './pages/DevAgentPage.jsx'
import JobRadarPage from './pages/JobRadarPage.jsx'
import CustomizeResumePage from './pages/CustomizeResumePage.jsx'
import PlaceholderPage from './pages/PlaceholderPage.jsx'
import ModelConfigPage from './pages/ModelConfigPage.jsx'
import JobSourcesPage from './pages/JobSourcesPage.jsx'
import ResumePage from './pages/ResumePage.jsx'
import ResumeEditPage from './pages/ResumeEditPage.jsx'
import EmailSettingsPage from './pages/EmailSettingsPage.jsx'
import ApplicationsPage from './pages/ApplicationsPage.jsx'
import InterviewPage from './pages/InterviewPage.jsx'

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<JobRadarPage />} />
      <Route path="/resumes/customize" element={<CustomizeResumePage />} />
      <Route path="/resume" element={<ResumePage />} />
      <Route path="/resume/edit/:id" element={<ResumeEditPage />} />
      <Route path="/resumes" element={<Navigate to="/resume" replace />} />
      <Route path="/matches" element={<PlaceholderPage />} />
      <Route path="/applications" element={<ApplicationsPage />} />
      <Route path="/interviews" element={<InterviewPage />} />
      <Route path="/preferences" element={<PlaceholderPage />} />
      <Route path="/sources" element={<JobSourcesPage />} />
      <Route path="/settings/model" element={<ModelConfigPage />} />
      <Route path="/settings/email" element={<EmailSettingsPage />} />
      <Route path="/dev/agent" element={<DevAgentPage />} />
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}
