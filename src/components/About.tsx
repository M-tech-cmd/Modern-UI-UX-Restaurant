import { Award, Users, Heart } from 'lucide-react';

export default function About() {
  const features = [
    {
      icon: <Award className="h-8 w-8" />,
      title: 'Award-Winning',
      description: 'Recognized for culinary excellence and outstanding service',
    },
    {
      icon: <Users className="h-8 w-8" />,
      title: 'Expert Chefs',
      description: 'Trained in Michelin-starred kitchens across Europe',
    },
    {
      icon: <Heart className="h-8 w-8" />,
      title: 'Made with Love',
      description: 'Every dish crafted with passion and finest ingredients',
    },
  ];

  return (
    <section id="about" className="py-20 bg-slate-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid lg:grid-cols-2 gap-12 items-center">
          <div className="space-y-6">
            <div className="space-y-3">
              <h2 className="text-4xl sm:text-5xl font-bold text-slate-900">
                Our Story
              </h2>
              <div className="h-1 w-24 bg-amber-500 rounded-full" />
            </div>
            <p className="text-lg text-gray-700 leading-relaxed">
              Founded in 2010, Savoria has been delighting guests with an exceptional dining
              experience that combines innovative cuisine with timeless elegance. Our passion
              for culinary excellence drives us to source the finest seasonal ingredients and
              craft dishes that celebrate both tradition and creativity.
            </p>
            <p className="text-lg text-gray-700 leading-relaxed">
              Led by Chef Frele Martinez, our team brings decades of international experience
              to create a menu that reflects the rich tapestry of Mediterranean and contemporary
              fusion cuisine. Each visit promises not just a meal, but a memorable journey
              through taste, texture, and presentation.
            </p>
            <div className="grid sm:grid-cols-3 gap-6 pt-6">
              {features.map((feature, index) => (
                <div
                  key={index}
                  className="text-center space-y-3 p-4 rounded-lg hover:bg-white hover:shadow-lg transition-all duration-300"
                >
                  <div className="inline-flex items-center justify-center w-16 h-16 bg-amber-100 text-amber-600 rounded-full">
                    {feature.icon}
                  </div>
                  <h3 className="font-semibold text-slate-900">{feature.title}</h3>
                  <p className="text-sm text-gray-600">{feature.description}</p>
                </div>
              ))}
            </div>
          </div>

          <div className="relative">
            <div className="relative h-[600px] rounded-2xl overflow-hidden shadow-2xl">
              <img
                src="https://images.pexels.com/photos/2788792/pexels-photo-2788792.jpeg?auto=compress&cs=tinysrgb&w=1200"
                alt="Chef preparing food"
                className="w-full h-full object-cover"
              />
            </div>
            <div className="absolute -bottom-6 -left-6 bg-amber-500 text-slate-900 p-8 rounded-xl shadow-xl max-w-xs">
              <div className="text-4xl font-bold">15+</div>
              <div className="text-lg font-medium">Years of Excellence</div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
