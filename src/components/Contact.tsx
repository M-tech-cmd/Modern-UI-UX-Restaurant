import { MapPin, Phone, Mail, Clock } from 'lucide-react';

export default function Contact() {
  const contactInfo = [
    {
      icon: <MapPin className="h-6 w-6" />,
      title: 'Address',
      details: ['123 Culinary Boulevard', 'Downtown District', 'New York, NY 10001'],
    },
    {
      icon: <Phone className="h-6 w-6" />,
      title: 'Phone',
      details: ['+1 (555) 123-4567', '+1 (555) 987-6543'],
    },
    {
      icon: <Mail className="h-6 w-6" />,
      title: 'Email',
      details: ['info@savoria.com', 'reservations@savoria.com'],
    },
    {
      icon: <Clock className="h-6 w-6" />,
      title: 'Hours',
      details: ['Monday - Friday: 5:00 PM - 11:00 PM', 'Saturday - Sunday: 12:00 PM - 11:00 PM'],
    },
  ];

  return (
    <section id="contact" className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center space-y-4 mb-12">
          <h2 className="text-4xl sm:text-5xl font-bold text-slate-900">
            Visit Us
          </h2>
          <div className="h-1 w-24 bg-amber-500 rounded-full mx-auto" />
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            We're here to serve you. Find us at our location or get in touch
          </p>
        </div>

        <div className="grid md:grid-cols-2 gap-8 items-start">
          <div className="space-y-6">
            {contactInfo.map((info, index) => (
              <div
                key={index}
                className="flex gap-4 p-6 bg-slate-50 rounded-xl hover:bg-slate-100 transition-all duration-300 hover:shadow-lg"
              >
                <div className="flex-shrink-0 w-12 h-12 bg-amber-500 text-white rounded-lg flex items-center justify-center">
                  {info.icon}
                </div>
                <div>
                  <h3 className="font-bold text-slate-900 text-lg mb-2">{info.title}</h3>
                  {info.details.map((detail, idx) => (
                    <p key={idx} className="text-gray-600">
                      {detail}
                    </p>
                  ))}
                </div>
              </div>
            ))}
          </div>

          <div className="h-[500px] rounded-xl overflow-hidden shadow-2xl">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.682503864242!2d-73.98823492346405!3d40.74844097138707!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259a9b3117469%3A0xd134e199a405a163!2sEmpire%20State%20Building!5e0!3m2!1sen!2sus!4v1710234567890!5m2!1sen!2sus"
              width="100%"
              height="100%"
              style={{ border: 0 }}
              allowFullScreen
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
              title="Restaurant Location"
            />
          </div>
        </div>
      </div>
    </section>
  );
}
